package com.lithan.ac.springboot_car_portal_demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lithan.ac.springboot_car_portal_demo.services.BidService;
import com.lithan.ac.springboot_car_portal_demo.services.CarService;
import com.lithan.ac.springboot_car_portal_demo.services.UserService;

public class UserController {
	
	 private static Logger logger = LoggerFactory.getLogger(CarController.class);

	    @Autowired
	    private CarService carService;
	    
	    @Autowired
	    private BidService carbidService;
	    
	    @Autowired
	    private UserService userService;
	
	

	  
}