package com.springapp.mvc;

import com.springapp.mvc.models.MyMovie;
import me.shib.java.lib.omdb.models.SearchResult;
import me.shib.java.lib.omdb.service.OMDbService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@Controller
@RequestMapping("/")
public class HelloController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("message", "Hello world!");
		return "result";
	}

	@RequestMapping(value = "/results", method = RequestMethod.POST)
	public String someMethod(@ModelAttribute("query") String query, ModelMap model) {

		OMDbService omDbService = new OMDbService();
		SearchResult[] results = omDbService.searchContent(query);
		ArrayList<MyMovie> movies = new ArrayList<MyMovie>();

		if(results != null){
			for (int i=0; i<results.length; i++) {
				if(results[i].getType()!=null && results[i].getType().toString().equals("movie")) {
					MyMovie temp = new MyMovie(results[i]);
					movies.add(temp);
				}
			}
		}



		model.addAttribute("results", movies);

		return "result";
	}
}