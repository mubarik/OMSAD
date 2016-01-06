$(function() {
    var breadcrumbs = $('div.breadcrumb:first');
    var tempText = breadcrumbs.html().split(' ');    

    if (tempText[0] == 'Home') {
        tempText[0] = '<span style="color:#003366">'+tempText[0]+'</span>';
        var newBreadcrumbs = "";
        for(var i = 0; i < tempText.length; i++)
            newBreadcrumbs += tempText[i]+' ';
        breadcrumbs.html(newBreadcrumbs);
    }

    var currentPageLink = breadcrumbs.children('a:last');
    var currentPageLinkText = currentPageLink.text();
    currentPageLink.remove();
    breadcrumbs.append('<span style="color:#A64C10;">'+currentPageLinkText+'</span>');
    breadcrumbs.show();
});

