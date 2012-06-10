function gotoLinkWithCurrentPageURL(url) {
    window.location = url + "?redirect_to=" + window.location.href
}