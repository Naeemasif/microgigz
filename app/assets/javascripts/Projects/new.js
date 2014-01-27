/*sending ajax request for client name*/
function find_client_name(x)
{
    document.getElementById("progress").style.visibility = "visible";
    $.ajax({
        url:   "/projects/get_client_name",
        data:  {'lead_id':x.options[x.selectedIndex].value},
        type: 'GET'
    });
}

