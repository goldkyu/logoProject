let seatnametemp = "";
      $(".cinema-seats .seat").on("click", function () {
        seatnametemp = "";
        $(this).toggleClass("active");
        let active = $(".seat.active");
        active.each(function () {
          let seatsPerRow = $(this).parent().find(".seat").length;
          if (!$(this).closest(".cinema-seats").hasClass("right")) {
            let prevRows =
              $(this).parent(".cinema-row").prevAll(".cinema-row").length - 1;
            seatnametemp +=
              (prevRows + 1).toString() +
              ($(this).index() + 9).toString(36).toUpperCase() +
              " ";
          } else {
            let leftSeats = $(".left").find(".seat").length;
            let prevRows = $(this).parent(".cinema-row").prevAll(".cinema-row")
              .length;
            seatnametemp +=
              (prevRows + 8).toString() +
              ($(this).index() + 9).toString(36).toUpperCase() +
              " ";
          }
        });
        var bookedSeats = document.querySelectorAll(".active").length;
        document.querySelector(".booked").innerHTML = bookedSeats + "매";
        document.querySelector(".seatsbooked").innerHTML = seatnametemp;
        
        
        
        
        });
   
      
      function handleOnChange(e) {
    	  // 선택된 데이터의 텍스트값 가져오기
    	  const text = e.options[e.selectedIndex].text;
    	  
    	  console.log(e.options);
    	  
    	  // 선택한 텍스트 출력
    	  document.getElementById("result").innerText
    	    = text;
    	}