package com.mary.belt.services;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.mary.belt.models.Show;
import com.mary.belt.repositories.ShowRepository;



@Service
public class ShowService {
	private final ShowRepository showRepository;
	public ShowService(ShowRepository showRepository) {
		this.showRepository = showRepository;
		
	}
	public Show creatShow(@Valid Show show) {
		return showRepository.save(show);
	}
	public Iterable<Show> allShows() {
		
		return showRepository.findAll();
	}
	public Show findShow(Long id) {
		
		Optional<Show> optionalShow = showRepository.findById(id);
		 if(optionalShow .isPresent()) {
			 return optionalShow .get();
		 } else {
			 return null;
		 } 
	}
	public void updateShow(@Valid Show show2) {
		showRepository.save(show2);
		
	}
	public void deleteShow(Long id) {
		showRepository.deleteById(id);
		
	}

}
