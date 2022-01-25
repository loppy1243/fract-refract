const init_trans_time = 1100;

class Aside {
    constructor(body, side) {
        this.body = body;
        this.side = side;
    }
}

var asides = [];

const aside_bodies = Array.from(document.getElementsByName("aside"));
const side_content = document.currentScript.parentElement;
for (const body of aside_bodies) {
    const side = document.createElement("aside");

    for (const attr of body.attributes) {
        if (attr.name === "name")
            continue;
        side.setAttribute(attr.name, attr.value);
        body.removeAttribute(attr.name);
    }

    side.style["transition-property"] = "top";
    side.style["transition-duration"] =
        init_trans_time + "ms";
    side.append(...body.childNodes);
    side.style.top = "150%";
    side_content.append(side);

    body.replaceChildren(new Comment("content has been moved to side"));
    asides.push(new Aside(body, side));
}

asides.reverse();

function update_asides() {
    for (const a of globalThis.asides) {
        const y =
            a.body.getBoundingClientRect().top
            - side_content.getBoundingClientRect().top;
        a.side.style.top = y + "px";
    }
}

function adjust_asides() {
    for (let i = globalThis.asides.length - 1; i > 0; --i) {
        const rect1 = globalThis.asides[i].side.getBoundingClientRect();
        const rect2 = globalThis.asides[i-1].side.getBoundingClientRect();
        const side_rect_top = side_content.getBoundingClientRect().top;
        let rect1_new_top = rect1.top - side_rect_top;

        if (rect1.bottom > rect2.top) {
            rect1_new_top -= rect1.bottom - rect2.top;
        }
        
        globalThis.asides[i].side.style.top = rect1_new_top + "px";
    }
}

function sleepFor(f, t) {
    return new Promise(
        resolve => setTimeout(() => { f(); resolve() }, t)
    );
}

async function first_update() {
    await sleepFor(() => {}, 300);
    update_asides();
    await sleepFor(() => {}, init_trans_time);
    for (const aside of globalThis.asides) {
        aside.side.style["transition-duration"] = "250ms";
    }
    adjust_asides();
}

async function update() {
    update_asides();
    await sleepFor(() => {}, 300);
    adjust_asides();
}

first_update();

let timeout_id = null;
window.addEventListener("resize", () => {
    if (timeout_id) clearTimeout(timeout_id);
    timeout_id = setTimeout(update,500);
});
