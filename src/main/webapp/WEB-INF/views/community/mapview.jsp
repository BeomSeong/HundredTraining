<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hundred Training</title>
<script src="http://code.jquery.com/jquery.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=&libraries=places&callback=initMap"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>

<script>
var map;
var infowindow;
var service;

function initMap() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };

            map = new google.maps.Map(document.getElementById('map'), {
                center: pos,
                zoom: 15
            });

            infowindow = new google.maps.InfoWindow();

            service = new google.maps.places.PlacesService(map);

            google.maps.event.addListener(map, 'bounds_changed', function() {
                var bounds = map.getBounds();
                searchGyms(bounds.getCenter());
            });

            document.getElementById('district').addEventListener('change', function() {
                var district = this.value;
                var geocoder = new google.maps.Geocoder();

                geocoder.geocode({'address': district + ', Seoul, South Korea'}, function(results, status) {
                    if (status === 'OK') {
                        map.setCenter(results[0].geometry.location);
                    }
                });
            });
        }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
        });
    } else {
        // Browser doesn't support Geolocation
        handleLocationError(false, infoWindow, map.getCenter());
    }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ?
                          'Error: The Geolocation service failed.' :
                          'Error: Your browser doesn\'t support geolocation.');
    infoWindow.open(map);
}

function searchGyms(location) {
    service.nearbySearch({
        location: location,
        radius: 500,
        type: ['gym']
    }, callback);
}

function callback(results, status) {
    if (status === google.maps.places.PlacesServiceStatus.OK) {
        for (var i = 0; i < results.length; i++) {
            createMarker(results[i]);
        }
    }
}

function createMarker(place) {
    var placeLoc = place.geometry.location;
    var marker = new google.maps.Marker({
        map: map,
        position: place.geometry.location
    });

    google.maps.event.addListener(marker, 'click', function() {
        service.getDetails({placeId: place.place_id}, function(result, status) {
            if (status !== google.maps.places.PlacesServiceStatus.OK) {
                console.error(status);
                return;
            }
            infowindow.setContent(result.name + '<br>' + result.formatted_address + '<br>' + result.formatted_phone_number);
            infowindow.open(map, marker);
        });
    });
}
</script>
<style>
#map {
    height: 70vh;
    width: 70vw;
}
</style>
</head>
<body>
<div class="container">
<jsp:include page="../main/header.jsp"></jsp:include>
    <div>
	  <h1>헬스장 찾기</h1>
	</div>
    <form>
        <div>
            <div id="map"></div>
            <div>
            	<div>
                    <select id="district">
                        <option value="">지역선택</option>
                        <option value="Gangnam-gu">강남구</option>
                        <option value="Gangnam-gu">강남구</option>
					    <option value="Gangdong-gu">강동구</option>
					    <option value="Gangbuk-gu">강북구</option>
					    <option value="Gangseo-gu">강서구</option>
					    <option value="Gwanak-gu">관악구</option>
					    <option value="Gwangjin-gu">광진구</option>
					    <option value="Guro-gu">구로구</option>
					    <option value="Geumcheon-gu">금천구</option>
					    <option value="Nowon-gu">노원구</option>
					    <option value="Dobong-gu">도봉구</option>
					    <option value="Dongdaemun-gu">동대문구</option>
					    <option value="Dongjak-gu">동작구</option>
					    <option value="Mapo-gu">마포구</option>
					    <option value="Seodaemun-gu">서대문구</option>
					    <option value="Seocho-gu">서초구</option>
					    <option value="Seongdong-gu">성동구</option>
					    <option value="Seongbuk-gu">성북구</option>
					    <option value="Songpa-gu">송파구</option>
					    <option value="Yangcheon-gu">양천구</option>
					    <option value="Yeongdeungpo-gu">영등포구</option>
					    <option value="Yongsan-gu">용산구</option>
					    <option value="Eunpyeong-gu">은평구</option>
					    <option value="Jongno-gu">종로구</option>
					    <option value="Jung-gu">중구</option>
					    <option value="Jungnang-gu">중랑구</option>
                    </select>
                </div>
                <div><button>확인</button></div>
            </div>
        </div>
    </form>
<jsp:include page="../main/footer.jsp"></jsp:include>
</div>
</body>
</html>
