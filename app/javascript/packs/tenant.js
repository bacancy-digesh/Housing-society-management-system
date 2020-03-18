$(document).ready(function () {
            $("#owner_house_no").on("change",function () {
                
                $.ajax({
                    type: "GET",
                    url: "/search",
                    data: {owner_house_no:  $("#owner_house_no").val(),owner_block:  $("#owner_block").val() },
                    ContentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(data){
                        if (data["owner"] == null){
                        
                        alert("select correct option");
                            $("#owner_name").html("");
                             $("#contact_no").html("");
                             $("#owner_detail").hide();
                        }
                        else{
                            $("#owner_detail").show();
                            $("#owner_name").html(data["owner"]["owner_name"])
                             $("#contact_no").html(data["owner"]["contact_no"])
                        }
                    }
                });
            });





        });