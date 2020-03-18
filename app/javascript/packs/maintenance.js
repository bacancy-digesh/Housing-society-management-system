$(document).ready(function () {
            $("#owner_block").on("change",function () {
                
                $.ajax({
                    type: "GET",
                    url: "/maintenance_detail",
                    data: {owner_block:  $("#owner_block").val() },
                    ContentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(data){
                    	
                        
        				var  string = "";
				        var checkbox="";
				        var textfield="";
				        $("#owner_detail").show();
				        for(var i=0; i<data["owner"].length; i++)
				        {
				          // debugger
				          checkbox = "<td><input type='checkbox' id='"+ data["owner"][i]["id"] +"' name= owner_ids["+ data["owner"][i]["id"] +"] value='"+ data["owner"][i]["id"] +"'></input></td>"; 
				          string +=  "<tr><td>"+ data["owner"][i]["owner_name"]+
							          "</td><td>"+ data["owner"][i]["contact_no"] +
							          "</td><td>"+data["owner"][i]["block"]+
							          "</td><td>"+data["maintenance_detail"][i]["total_month_maintanence"]+
							          "</td><td>"+checkbox+"</td></tr>";
				        }
				        $("#members").html(string);

                        }
                    });

                });
            });