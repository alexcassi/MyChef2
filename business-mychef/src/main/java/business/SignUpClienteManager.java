package business;

import javax.persistence.EntityManager;

import modello.Cliente;
import modello.Utente;
import utility.JPAUtility;

public class SignUpClienteManager {
	public static boolean checkUsernameExists(String email) {
		return JPAUtility.getEntityManager().find(Utente.class, email) != null;
	}

	public static Cliente signUp(String nome, String cognome, String comune, String provincia, String indirizzo,
			String email, String password) {
		EntityManager em = JPAUtility.getEntityManager();
		Cliente u = new Cliente();
		u.setEmail(email);
		u.setPassword(password);
		u.setNome(nome);
		u.setCognome(cognome);
		u.setComune(comune);
		u.setProvincia(provincia);
		u.setIndirizzo(indirizzo);

		em.getTransaction().begin();
		em.persist(u);
		em.getTransaction().commit();
		return u;
	}
	
	public static void modificaIndirizzoCliente(String email, String comune, String indirizzo, String provincia) {
		EntityManager em = JPAUtility.getEntityManager();
		Cliente r = em.find(Cliente.class, email);
		if(r==null)
		{
			
		} else {
		em.getTransaction().begin();	
		r.setComune(comune);
		r.setIndirizzo(indirizzo);
		r.setProvincia(provincia);
		em.getTransaction().commit();
		}
	}
}
