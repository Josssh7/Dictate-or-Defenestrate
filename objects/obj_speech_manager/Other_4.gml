menu = create_select_menu(room_width*0.5, room_height * 0.5, [ 
							new SelectOption({text:"Improving Public Relations"}, select_topic),
							new SelectOption({text:"Inspiring Enlistment"}, select_topic),
							new SelectOption({text:"Securing Funds"}, select_topic)], 0.15, "center", "What is Today's Agenda?");