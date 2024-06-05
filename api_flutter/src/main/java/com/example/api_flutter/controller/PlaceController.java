package com.example.api_flutter.controller;

import com.example.api_flutter.model.Place;
import com.example.api_flutter.services.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class PlaceController {
    @Autowired
    private PlaceService placeService;

    @GetMapping("/getPlaces")
    public List<Place> getPlaces() {
        return placeService.getPlaces();
    }
}
