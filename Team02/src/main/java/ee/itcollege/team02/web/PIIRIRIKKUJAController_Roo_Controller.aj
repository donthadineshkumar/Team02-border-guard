// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.team02.web;

import ee.itcollege.team02.entities.ISIK_INTSIDENDIS;
import ee.itcollege.team02.entities.KODAKONDSUS;
import ee.itcollege.team02.entities.OBJEKT;
import ee.itcollege.team02.entities.PIIRIRIKKUJA;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PIIRIRIKKUJAController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String PIIRIRIKKUJAController.create(@Valid PIIRIRIKKUJA PIIRIRIKKUJA, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("PIIRIRIKKUJA", PIIRIRIKKUJA);
            addDateTimeFormatPatterns(uiModel);
            return "piiririkkujas/create";
        }
        uiModel.asMap().clear();
        PIIRIRIKKUJA.persist();
        return "redirect:/piiririkkujas/" + encodeUrlPathSegment(PIIRIRIKKUJA.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String PIIRIRIKKUJAController.createForm(Model uiModel) {
        uiModel.addAttribute("PIIRIRIKKUJA", new PIIRIRIKKUJA());
        addDateTimeFormatPatterns(uiModel);
        return "piiririkkujas/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String PIIRIRIKKUJAController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("piiririkkuja", PIIRIRIKKUJA.findPIIRIRIKKUJA(id));
        uiModel.addAttribute("itemId", id);
        return "piiririkkujas/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String PIIRIRIKKUJAController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("piiririkkujas", PIIRIRIKKUJA.findPIIRIRIKKUJAEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) PIIRIRIKKUJA.countPIIRIRIKKUJAS() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("piiririkkujas", PIIRIRIKKUJA.findAllPIIRIRIKKUJAS());
        }
        addDateTimeFormatPatterns(uiModel);
        return "piiririkkujas/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PIIRIRIKKUJAController.update(@Valid PIIRIRIKKUJA PIIRIRIKKUJA, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("PIIRIRIKKUJA", PIIRIRIKKUJA);
            addDateTimeFormatPatterns(uiModel);
            return "piiririkkujas/update";
        }
        uiModel.asMap().clear();
        PIIRIRIKKUJA.merge();
        return "redirect:/piiririkkujas/" + encodeUrlPathSegment(PIIRIRIKKUJA.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String PIIRIRIKKUJAController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("PIIRIRIKKUJA", PIIRIRIKKUJA.findPIIRIRIKKUJA(id));
        addDateTimeFormatPatterns(uiModel);
        return "piiririkkujas/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String PIIRIRIKKUJAController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PIIRIRIKKUJA.findPIIRIRIKKUJA(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/piiririkkujas";
    }
    
    @ModelAttribute("isik_intsidendiss")
    public Collection<ISIK_INTSIDENDIS> PIIRIRIKKUJAController.populateISIK_INTSIDENDISs() {
        return ISIK_INTSIDENDIS.findAllISIK_INTSIDENDISs();
    }
    
    @ModelAttribute("kodakondsus")
    public Collection<KODAKONDSUS> PIIRIRIKKUJAController.populateKODAKONDSUS() {
        return KODAKONDSUS.findAllKODAKONDSUS();
    }
    
    @ModelAttribute("objekts")
    public Collection<OBJEKT> PIIRIRIKKUJAController.populateOBJEKTS() {
        return OBJEKT.findAllOBJEKTS();
    }
    
    @ModelAttribute("piiririkkujas")
    public Collection<PIIRIRIKKUJA> PIIRIRIKKUJAController.populatePIIRIRIKKUJAS() {
        return PIIRIRIKKUJA.findAllPIIRIRIKKUJAS();
    }
    
    void PIIRIRIKKUJAController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("PIIRIRIKKUJA_synniaeg_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("PIIRIRIKKUJA_avatud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("PIIRIRIKKUJA_muudetud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("PIIRIRIKKUJA_suletud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String PIIRIRIKKUJAController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}