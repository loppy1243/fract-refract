import Franklin
import Dates

function groupby(f, itr)
    isfirst = true
    cur = f(first(itr))
    ret = Vector{eltype(itr)}[]
    for x in itr
        if isfirst || cur != f(x)
            isfirst = false
            push!(ret, eltype(itr)[])
        end

        push!(ret[end], x)
    end

    ret
end

function stringclamp(s, n)
    if length(s) <= n
        s
    else
        s[1:n-3] * "..."
    end
end

hfun_bloglist() = hfun_bloglist([])
function hfun_bloglist(params)
    maxentries = if length(params) == 0
        nothing
    elseif length(params) == 1
        parse(Int, params[1])
    else
        error("hfun_bloglist expects at most one argument")
    end

    bloglist = globvar("bloglist")
    html = IOBuffer(; read=false, write=true)

    indent = 0
    write(html, ' '^indent, "<ul class=\"blog-list\">\n")
    # Offset from where this is called
    indent += 2

    numentries = 0
    indent += 2
    for dategroup in groupby(x -> x.date, bloglist)
        date = dategroup[1].date

        if length(dategroup) > 1
            write(html, ' '^indent, "<li class=\"blog-list-date\">\n")
        else
            write(html, ' '^indent, "<li class=\"blog-list-date blog-list-date-inline\">\n")
        end
        indent += 2

        datestring = string(date) * ':'

        if length(dategroup) > 1
            write(html,
                ' '^indent, "<span>", datestring, "</span>\n",
                ' '^indent, "<ul class=\"blog-sublist\">\n"
            )
            indent += 2
        else
            write(html, ' '^indent, "<span>", datestring, "</span>\n")
        end

        for blog in dategroup
            if !isnothing(maxentries) && numentries >= maxentries
                break
            end

            aref = "<a href=\"/"*blog.path*"\">" * blog.meta["title"] * "</a>"

            if length(dategroup) > 1
                write(html, ' '^indent, "<li>", aref, "</li>\n")
            else
                write(html, ' '^indent, aref, '\n')
            end

            numentries += 1
        end
        if length(dategroup) > 1
            indent -= 2
            write(html, ' '^indent, "</ul>\n")
        end
        indent -= 2
        write(html, ' '^indent, "</li>\n")

        if !isnothing(maxentries) && numentries >= maxentries
            break
        end
    end
    indent -= 2
    write(html, ' '^indent, "</ul>")

    String(take!(html))
end

BLOG = nothing
BLOG_INDEX = nothing
PREV_BLOG = nothing
NEXT_BLOG = nothing

function hfun_initblog()
    fd_rpath = locvar("fd_rpath")

    namematch = match(r"^[^.]+", basename(fd_rpath))
    if isnothing(namematch)
        error(locvar(fd_rpath), " is an invalid blog file name")
    end
    name = namematch.match

    bloglist = globvar("bloglist")

    idx = findfirst(x -> x.name == name, bloglist)
    if isnothing(idx)
        error(fd_rpath, " is not a blog post")
    end

    global BLOG = bloglist[idx]

    global PREV_BLOG = if idx > 1
        bloglist[idx-1]
    else
        nothing
    end

    global NEXT_BLOG = if idx < length(bloglist)
        bloglist[idx+1]
    else
        nothing
    end

    Franklin.set_var!(Franklin.LOCAL_VARS, "isfirstblog", isnothing(PREV_BLOG))
    Franklin.set_var!(Franklin.LOCAL_VARS, "islastblog", isnothing(NEXT_BLOG))

    ""
end

hfun_prevblogpath() = '/'*PREV_BLOG.path

function hfun_prevbloginfo()
    date = Dates.format(PREV_BLOG.date, Dates.dateformat"u dd")
    prevblogtitle = PREV_BLOG.meta["title"]
    blognavcharwidth = globvar("blognavcharwidth")

    string(date) * ": " * stringclamp(prevblogtitle, blognavcharwidth)
end

hfun_nextblogpath() = '/'*NEXT_BLOG.path

function hfun_nextbloginfo()
    date = Dates.format(NEXT_BLOG.date, Dates.dateformat"u dd")
    nextblogtitle = NEXT_BLOG.meta["title"]
    blognavcharwidth = globvar("blognavcharwidth")

    string(date) * ": " * stringclamp(nextblogtitle, blognavcharwidth)
end

### Examples
#function hfun_bar(vname)
#  val = Meta.parse(vname[1])
#  return round(sqrt(val), digits=2)
#end
#
#function hfun_m1fill(vname)
#  var = vname[1]
#  return pagevar("index", var)
#end
#
#function lx_baz(com, _)
#  # keep this first line
#  brace_content = Franklin.content(com.braces[1]) # input string
#  # do whatever you want here
#  return uppercase(brace_content)
#end
