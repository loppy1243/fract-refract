module Blogs
export BlogEntry

import Dates, YAML

struct BlogEntry
    name::String
    date::Dates.Date
    meta::Dict{Any,Any}
end
Base.getproperty(blog::BlogEntry, prop::Symbol) =
    if prop === :path
        # This will be valid for the next ~8000 years
        #     or until time travel is invented,
        #     or anything else unforseen.
        joinpath(
            "blog", "posts",
            string(Dates.year(blog.date)),
            lpad(Dates.month(blog.date), 2, '0'),
            lpad(Dates.day(blog.date), 2, '0'),
            getfield(blog, :name)
        )
    else
        getfield(blog, prop)
    end


function buildlist()
    blogdirlen = length("blog/posts/YYYY/MM/DD")
    bloglist = BlogEntry[]

    for (root, _, _) in walkdir("blog/posts")
        # So that we avoid trying to match the regex when it's futile
        length(root) != blogdirlen && continue

        datematch = match(r"^blog/posts/(\d\d\d\d)/(\d\d)/(\d\d)", root)
        isnothing(datematch) && continue
        year, month, day = datematch
        date = Dates.Date(parse(Int, year), parse(Int, month), parse(Int, day))

        metafile = joinpath(root, "meta.yaml")
        isfile(metafile) || error("No meta.yaml for ", root)

        meta = YAML.load_file(metafile)
        isempty(meta) && continue

        for (file, filemeta) in meta
            name_ext = rsplit(file, '.'; limit=2, keepempty=false)
            if length(name_ext) != 2
                error(
                    joinpath(root, file),
                    " is not a valid filename for a blog post"
                )
            end

            push!(bloglist, BlogEntry(name_ext[1], date, filemeta))
        end
    end

    sort!(bloglist; by=x->x.date, rev=true)

    bloglist
end

end # module Blogs
