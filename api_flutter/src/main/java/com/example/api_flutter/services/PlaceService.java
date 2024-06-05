package com.example.api_flutter.services;

import com.example.api_flutter.model.Place;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PlaceService {
    public List<Place> getPlaces() {
        List<Place> places = new ArrayList<>();
        places.add(new Place("Paris", "City of Light", "https://example.com/paris.jpg"));
        places.add(new Place("New York", "The Big Apple", "https://example.com/ny.jpg"));
        places.add(new Place("Tokyo", "Land of the Rising Sun", "https://example.com/tokyo.jpg"));
        return places;
    }
}
