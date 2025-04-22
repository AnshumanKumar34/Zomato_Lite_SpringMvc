package org.jsp;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FoodItemController {

	@Autowired
	private EntityManager em;
	
	@RequestMapping("/save")
	public ModelAndView save(@RequestParam String name,
			               @RequestParam String description,
			               @RequestParam String category,
			               @RequestParam String type,
			               @RequestParam double price,
			               @RequestParam double rating,      
			               @RequestParam String image){
		
		FoodItem fi=new FoodItem(0,name,description,category,type,price,rating,image);
		EntityTransaction et=em.getTransaction();
		et.begin();
		em.persist(fi);
		et.commit();
		
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("index.jsp");
		return mv;
		
	}
	
	@RequestMapping("/all")
	public ModelAndView findAllFoodItems() {
		
		Query q = em.createQuery("select fi from FoodItem fi");

		List<FoodItem> fil = q.getResultList();

		ModelAndView mv=new ModelAndView();
		mv.setViewName("allfooditems.jsp");
		mv.addObject("fil",fil);
		return mv;
	}
	
	@RequestMapping("/delete")
	public ModelAndView deleteFoodItem(@RequestParam int id) {
		FoodItem fi = em.find(FoodItem.class, id);
		EntityTransaction et = em.getTransaction();

		et.begin();
		em.remove(fi);
		et.commit(); 
        
		return findAllFoodItems();
	}
	
	@RequestMapping("/updatepage")
	public ModelAndView updatepage(@RequestParam int id) {
		
		FoodItem fi=em.find(FoodItem.class, id);
		EntityTransaction et=em.getTransaction();
		et.begin();
		em.merge(fi);
		et.commit();
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("update.jsp");
		mv.addObject("f",fi);
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(@RequestParam int id,
			@RequestParam String name,
            @RequestParam String description,
            @RequestParam String category,
            @RequestParam String type,
            @RequestParam double price,
            @RequestParam double rating,      
            @RequestParam String image) {
		
		FoodItem fi=em.find(FoodItem.class, id);
		fi.setName(name);
		fi.setDescription(description);
		fi.setCategory(category);
		fi.setType(type);
		fi.setPrice(price);
		fi.setRating(rating);
		fi.setImage(image);
		
		EntityTransaction et=em.getTransaction();
		
		et.begin();
		em.merge(fi);
		et.commit();
		return findAllFoodItems();
	}
	
	@RequestMapping("/orderpage")
	public ModelAndView orderPage() {
	    Query q = em.createQuery("select fi from FoodItem fi");

	    List<FoodItem> fil = q.getResultList();  

	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("order.jsp"); // JSP should have JSTL to loop over 'foodItems'
	    mv.addObject("foodItems", fil); 
	    return mv;
	}



}
	
