const apiKey = "5ae2e3f221c38a28845f05b60ef90071a390a70ea0c5ceb70dd38c42";

function apiGet(method, query) {
    return new Promise(function (resolve, reject) {
        var otmAPI =
            "https://api.opentripmap.com/0.1/en/places/" +
            method +
            "?apikey=" +
            apiKey;
        if (query !== undefined) {
            otmAPI += "&" + query;
        }
        fetch(otmAPI)
            .then(response => response.json())
            .then(data => resolve(data))
            .catch(function (err) {
                console.log("Fetch Error :-S", err);
            });
    });
}

const pageLength = 5; // number of objects per page

let lon; // place longitude
let lat; // place latitude

let offset = 0; // offset from first object in the list
let count; // total objects count

document
    .getElementById("search_form")
    .addEventListener("submit", function (event) {
        let name = document.getElementById("textbox").value;
        apiGet("geoname", "name=" + name).then(function (data) {
            let message = "Name not found";
            if (data.status == "OK") {
                message = data.name + ", " + data.country;
                lon = data.lon;
                lat = data.lat;
                firstLoad();
            }
            document.getElementById("info").innerHTML = `${message}`;
        });
        event.preventDefault();
    });




function firstLoad() {
    apiGet(
        "radius",
        `radius=1000&limit=${pageLength}&offset=${offset}&lon=${lon}&lat=${lat}&rate=2&format=count`
    ).then(function (data) {
        count = data.count;
        offset = 0;
        document.getElementById(
            "info"
        ).innerHTML += `<p>${count} 2 résultats avec description dans un rayon d'un kilomètre</p>`;
        loadList();
    });
}




function loadList() {
    apiGet(
        "radius",
        `radius=1000&limit=${pageLength}&offset=${offset}&lon=${lon}&lat=${lat}&rate=2&format=json`
    ).then(function (data) {
        let list = document.getElementById("list");
        list.innerHTML = "";
        data.forEach(item => list.appendChild(createListItem(item)));
        let nextBtn = document.getElementById("next_button");
        if (count < offset + pageLength) {
            nextBtn.style.visibility = "hidden";
        } else {
            nextBtn.style.visibility = "visible";
            nextBtn.innerText = `Next (${offset + pageLength} of ${count})`;
        }
    });
}





function createListItem(item) {
    let a = document.createElement("a");
    a.className = "list-group-item list-group-item-action";
    a.setAttribute("data-id", item.xid);
    a.innerHTML = `<h5 class="list-group-item-heading">${item.name}</h5>`;

    a.addEventListener("click", function () {
        document.querySelectorAll("#list a").forEach(function (item) {
            item.classList.remove("active");
        });
        this.classList.add("active");
        let xid = this.getAttribute("data-id");
        apiGet("xid/" + xid).then(data => onShowPOI(data));
    });
    return a;
}




function onShowPOI(data) {
    let poi = document.getElementById("poi");
    poi.innerHTML = "";
    if (data.preview) {
        poi.innerHTML += `<img src="${data.preview.source}">`;
    }
    poi.innerHTML += data.wikipedia_extracts
        ? data.wikipedia_extracts.html
        : data.info
            ? data.info.descr
            : "No description";
}

document.getElementById("textbox").addEventListener("input", function () {
    if (this.value === "") {
        clearResults();
    }
});

document.getElementById("next_button").addEventListener("click", function () {
    offset += pageLength;
    loadList();
});

function clearResults() {
    document.getElementById("list").innerHTML = "";
    document.getElementById("poi").innerHTML = "";
    document.getElementById("info").innerHTML = "";
    offset = 0;
    document.getElementById("next_button").style.visibility = "hidden";
}
