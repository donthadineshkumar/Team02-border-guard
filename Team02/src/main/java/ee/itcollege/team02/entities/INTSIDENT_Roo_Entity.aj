// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.team02.entities;

import ee.itcollege.team02.entities.INTSIDENT;
import java.lang.Long;
import java.util.List;
import javax.persistence.Entity;

privileged aspect INTSIDENT_Roo_Entity {
    
    declare @type: INTSIDENT: @Entity;
    
    public static long INTSIDENT.countINTSIDENTS() {
        return entityManager().createQuery("SELECT COUNT(o) FROM INTSIDENT o", Long.class).getSingleResult();
    }
    
    public static INTSIDENT INTSIDENT.findINTSIDENT(Long id) {
        if (id == null) return null;
        return entityManager().find(INTSIDENT.class, id);
    }
    
    public static List<INTSIDENT> INTSIDENT.findINTSIDENTEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM INTSIDENT o", INTSIDENT.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
