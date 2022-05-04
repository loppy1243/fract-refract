// Taken from https://stackoverflow.com/questions/3624667/how-to-spamproof-a-mailto-link
function decryptEmail(encoded) {
    var address = atob(encoded);
    window.location.href = "mailto:" + address;
}
