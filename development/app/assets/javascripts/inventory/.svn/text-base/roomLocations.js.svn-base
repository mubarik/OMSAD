$(document).ready(function() {

    $('#forminventory div#roomLocations').hide();
    $('#forminventory #inventory_inventory_location_attributes_room_detail_id').change(function(){
        
        jQuery.ajax({
          url: "/inventory/inventories/populate_locations",
          async: false,
          dataType: "json",
          data:'id='+$('#forminventory #inventory_inventory_location_attributes_room_detail_id').val(),
          success: function(response)
          {
              //alert(response);
               $("#inventory_inventory_location_attributes_location_id").get(0).options.length = 0;
               $("#inventory_inventory_location_attributes_location_id").get(0).options[0] = new Option("Select Desk", "-1");
                var i = 1;
               $.each(response, function(index, item) {
                      $("#inventory_inventory_location_attributes_location_id").get(0).options[i] = new Option(item, index);
                      i++;
                });
                $('#forminventory div#roomLocations').slideDown();
          }
          //error: function() { alert("Failed to load courses");}
          
      });
  }); 

    $('#formIndexPopup div#roomLocations').hide();
    $('#formIndexPopup #room_detail_id_id').change(function(){
  

          jQuery.ajax({
          url: "/inventory/inventories/populate_locations",
          async: false,
          dataType: "json",
          data:'id='+$('#formIndexPopup #room_detail_id_id').val(),
          success: function(response)
          {
              //alert(response);
               $("#location_id_id").get(0).options.length = 0;
               $("#location_id_id").get(0).options[0] = new Option("Select Desk", "-1");
                var i = 1;
               $.each(response, function(index, item) {
                      $("#location_id_id").get(0).options[i] = new Option(item, index);
                      i++;
                });
                $('#formIndexPopup div#roomLocations').slideDown();
          }
          //error: function() { alert("Failed to load courses");}

      });

      });


      $('#forminventory div#inventoryAllocation').hide();
    $('#forminventory #inventory_type_id').change(function(){

        jQuery.ajax({
          url: "/inventory/inventories/populate_inventory_allocation",
          async: false,
          dataType: "json",
          data:'id='+$('#forminventory #inventory_type_id').val(),
          success: function(response)
          {
              //alert(response);
               $("#inventory_id").get(0).options.length = 0;
               $("#inventory_id").get(0).options[0] = new Option("Select inventory name", "-1");
                var i = 1;
               $.each(response, function(index, item) {
                      $("#inventory_id").get(0).options[i] = new Option(item, index);
                      i++;
                });
                $('#forminventory div#inventoryAllocation').slideDown();
          }
          //error: function() { alert("Failed to load courses");}

      });
  }); 

 $("#forminventory").bind('ajax:complete', function(evt, data, status, xhr)
    {
        $('.histGrid').html(data.responseText);
    });

});