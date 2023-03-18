package com.lithan.ac.springboot_car_portal_demo.services;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lithan.ac.springboot_car_portal_demo.controller.CarController;
import com.lithan.ac.springboot_car_portal_demo.daos.CarRepository;
import com.lithan.ac.springboot_car_portal_demo.daos.UserRepository;
import com.lithan.ac.springboot_car_portal_demo.entities.Car;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class CarService {
  
	private static final Logger logger = LoggerFactory.getLogger(CarController.class);

    @Autowired
    private CarRepository carRepository;
    private UserRepository userRepository;

    public List<Car> getAllCars() {
        return carRepository.findAll();
    }
    
    //used for both update and Save Car
    public void saveCar(Car car) {
       carRepository.save(car);
    }
    
	public Car get(Long id) {
		return carRepository.findById(id).get();
	}

	
	public void delete(Long id) {
		carRepository.deleteById(id);
	
	}
	
	
	
	public List<Car> search(String keyword) {
		return carRepository.search(keyword);
		
		}

}
