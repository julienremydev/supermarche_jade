package agents;

import fr.miage.agents.api.message.Message;
import fr.miage.agents.api.message.demande.Acheter;
import fr.miage.agents.api.message.demande.Recherche;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.UnreadableException;
import jade.core.behaviours.*;

public class AgentMarketEssquel extends CyclicBehaviour {
	private static final long serialVersionUID = 1L;

	@Override
	public void action() {
		ACLMessage msg = myAgent.receive();
		if (msg != null) {
			// Message received. Process it
			try {
				Message message = (Message) msg.getContentObject();
				ACLMessage reply = msg.createReply();
				this.interpreteMessage(message);
				myAgent.send(reply);
			} catch (UnreadableException e) {
				e.printStackTrace();
			}
		} else{
			block();
		}
	}


	public String interpreteMessage(Message message){
		String reponse = "";
		
		switch(message.type) {
			case Recherche:
				this.recherche((Recherche) message);
				break;
			case Achat:
				this.acheter((Acheter) message);
				break;
			default:
				reponse = "commande inconnue";
				break;
		}
		
		return reponse;
	}
	
	public String recherche(Recherche recherche){
		String ref = recherche.reference;
		// TODO Produit.rechercheProduit();
		return null;
	}
	
	public String acheter(Acheter achat){
		
		return null;
	}
}
