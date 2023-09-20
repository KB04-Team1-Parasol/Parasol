document.addEventListener("DOMContentLoaded", function() {
    // 순자산 탭 엘리먼트를 가져옵니다.
    var tab1 = document.getElementById("tab1-tab");
    var tab2 = document.getElementById("tab2-tab");
    var tab3 = document.getElementById("tab3-tab");
    var tab4 = document.getElementById("tab4-tab");
    

    // 각 이미지 엘리먼트를 가져옵니다.
    var image1 = document.getElementById("image1");
    var image2 = document.getElementById("image2");
    var image3 = document.getElementById("image3");
    var image4 = document.getElementById("image4");

    // 순자산 탭 클릭 시 이벤트 리스너를 추가합니다.
    tab1.addEventListener("click", function() {
        // 1번 이미지를 서서히 나타나게 설정
        fadeIn(image1);
        fadeOut(image2);
        fadeOut(image3);
        fadeOut(image4);
        console.log('test');
    });

    tab2.addEventListener("click", function() {
        // 2번 이미지를 서서히 나타나게 설정
        fadeOut(image1);
        fadeIn(image2);
        fadeOut(image3);
        fadeOut(image4);
    });

    tab3.addEventListener("click", function() {
        // 3번 이미지를 서서히 나타나게 설정
        fadeOut(image1);
        fadeOut(image2);
        fadeIn(image3);
        fadeOut(image4);
    });

    tab4.addEventListener("click", function() {
        // 4번 이미지를 서서히 나타나게 설정
        fadeOut(image1);
        fadeOut(image2);
        fadeOut(image3);
        fadeIn(image4);
    });
	
	
	 // 이미지 클릭 이벤트 핸들러
  image1.addEventListener("click", function () {
    // 1번 이미지를 서서히 나타나게 하고 연결된 탭을 클릭
    fadeIn(image1);
    fadeOut(image2);
    fadeOut(image3);
    fadeOut(image4);
    tab1.click();
  });

  image2.addEventListener("click", function () {
    // 2번 이미지를 서서히 나타나게 하고 연결된 탭을 클릭
    fadeOut(image1);
    fadeIn(image2);
    fadeOut(image3);
    fadeOut(image4);
    tab2.click();
  });

  image3.addEventListener("click", function () {
    // 3번 이미지를 서서히 나타나게 하고 연결된 탭을 클릭
    fadeOut(image1);
    fadeOut(image2);
    fadeIn(image3);
    fadeOut(image4);
    tab3.click();
  });

  image4.addEventListener("click", function () {
    // 4번 이미지를 서서히 나타나게 하고 연결된 탭을 클릭
    fadeOut(image1);
    fadeOut(image2);
    fadeOut(image3);
    fadeIn(image4);
    tab4.click();
  });
	
    // 서서히 나타나게 하는 함수
    function fadeIn(element) {
        element.style.transition = "opacity 0.6s linear"; // 원하는 지속 시간 설정
        element.style.opacity = "1"; // 투명도를 1로 설정하여 나타나게 함
        
    }

    // 서서히 사라지게 하는 함수
    function fadeOut(element) {
        element.style.transition = "opacity 0.1s linear"; // 원하는 지속 시간 설정
        element.style.opacity = "0.3"; // 투명도를 0으로 설정하여 사라지게 함
    }
    
    function selectTabOnImageClick() {
	    // 이미지 클릭 이벤트 핸들러
	    document.getElementById('image1').addEventListener('click', function() {
		    // 탭을 선택한 것처럼 클릭
		    document.getElementById('tab1-tab').click();
	    });
    }
});
  
var tab1 = document.getElementById("tab1-tab");
tab1.click();