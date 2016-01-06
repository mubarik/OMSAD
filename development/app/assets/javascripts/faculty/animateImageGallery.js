

$(document).ready(function()
{

    if (("#imageGalleryExpander").length>0)
    {

        $("#imageGalleryExpander").click(function()
        {
            $(".publicationImageGallery").animate(
            {
                opacity:1
            },3000)
        })
    }

})