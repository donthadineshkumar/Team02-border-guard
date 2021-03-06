package ee.itcollege.team02.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ee.itcollege.team02.common.Helper;
import ee.itcollege.team02.entities.INTSIDENDI_LIIK;
import ee.itcollege.team02.entities.INTSIDENT;
import ee.itcollege.team02.entities.PIIRILOIK;

@RequestMapping("/intsidendiregistreerimine/**")
@Controller
public class IntsidendiRegistreerimineController {

    @RequestMapping
    public void get(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    }
    
    @RequestMapping(method = RequestMethod.POST)
    public String post(ModelMap modelMap,Principal principal, HttpServletRequest request, HttpServletResponse response) 
    {
    	String kood = request.getParameter("kood")==null ? "" : request.getParameter("kood");
     	Long intsidendi_liik_ID = Long.parseLong(request.getParameter("liik")==null ? "0" : request.getParameter("liik"));
    	String nimetus = request.getParameter("nimetus")==null ? "" : request.getParameter("nimetus");
    	Long piiriloik_ID = Long.parseLong(request.getParameter("piiriloik")==null ? "0" : request.getParameter("piiriloik"));
    	Double latituud = Double.parseDouble(request.getParameter("latitude")==null ? "0" : request.getParameter("latitude"));
    	Double longituud = Double.parseDouble(request.getParameter("longitude")==null ? "0" : request.getParameter("longitude"));
    	Date algus = null, lopp = null;
		try {
			algus = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("startDate")==null ? "" : request.getParameter("startDate"));
			lopp = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("endDate")==null ? "" : request.getParameter("endDate"));
		} catch (ParseException e) {
			algus = new Date();
			lopp = new Date();
			e.printStackTrace();
		}
		String kirjeldus = request.getParameter("kirjeldus")==null ? "" : request.getParameter("kirjeldus");
		String kommentaar = request.getParameter("kommentaar")==null ? "" : request.getParameter("kommentaar");
    	
    	INTSIDENT newIntsident = new INTSIDENT();
    	newIntsident.setKood(kood);
    	newIntsident.setIntsidendi_liik(INTSIDENDI_LIIK.findINTSIDENDI_LIIK(intsidendi_liik_ID));
    	newIntsident.setNimetus(nimetus);
    	newIntsident.setPiiriloik(PIIRILOIK.findPIIRILOIK(piiriloik_ID));
    	newIntsident.setGPS_latituud(latituud);
    	newIntsident.setGPS_longituud(longituud);
    	newIntsident.setToimumise_algus(algus);
    	newIntsident.setToimumise_lopp(lopp);
    	newIntsident.setKirjeldus(kirjeldus);
    	newIntsident.setKommentaar(kommentaar);    	
    	newIntsident.persist();
    	
    	 return "redirect:/intsidendiredaktor/index?id=" + newIntsident.getId();
    }

    @RequestMapping
    public String index(Model uiModel) {		
    	List<INTSIDENT> intsidendid = INTSIDENT.findAllINTSIDENTS();
    	if(intsidendid.size() == 0){
    		Helper.addAndmed();
    	}
    	
    	List<PIIRILOIK> piiriloigud = PIIRILOIK.findAllPIIRILOIKS();
    	uiModel.addAttribute("piiriloigud", piiriloigud);
    	
    	List<INTSIDENDI_LIIK> liigid = INTSIDENDI_LIIK.findAllINTSIDENDI_LIIKs();
    	uiModel.addAttribute("liik", liigid);
    	
        return "intsidendiregistreerimine/index";
    }
}
