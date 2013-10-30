package com.epam.lab.buyit.controller.web.client;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.core.UriBuilder;

import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import com.epam.lab.buyit.controller.creator.MessageCreator;
import com.epam.lab.buyit.model.Message;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;

public class MessageClientWebService {
	private static final Logger LOGGER = Logger.getLogger(MessageClientWebService.class);
	private static URI baseUri;
	
	static {
		baseUri = UriBuilder.fromUri("http://192.168.12.220:8080/memorium/buyIt/").build();
	}

	public List<Message> getMessagesByUserId(int id) {
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource service = client.resource(baseUri);
		List<Message> messagesList = new ArrayList<Message>();
		MessageCreator creator = new MessageCreator();
		JSONObject object = new JSONObject();

		try {
			object.put("user_id", id);
			ClientResponse resp = service.path("messages/")
					.path(String.valueOf(id)).accept("application/json")
					.get(ClientResponse.class);
			JSONObject jsonObject = resp.getEntity(JSONObject.class);
			LOGGER.info("Recive message data: " + jsonObject);
			JSONArray messages = jsonObject.getJSONArray("messages");

			for (int i = 0; i < messages.length(); i++) {
				Message currentMessage = creator.create(messages.getJSONArray(i));
				messagesList.add(currentMessage.setToUserId(id));
			}

		} catch (JSONException e) {
			LOGGER.error(e);
		}

		return messagesList;
	}

	public boolean createMessage(Message message) {
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource service = client.resource(baseUri);

		boolean result = false;		
		try {
			JSONObject object = new JSONObject();
			object.put("message", message.getMessage());
			object.put("senderMessageId", message.getFromUserId());
			object.put("reciverMessageId", message.getToUserId());
			
			String encodedJson = URLEncoder.encode(object.toString(), "UTF-8");
			String path = baseUri.toString() + "message/new?message=" + encodedJson;
			
			LOGGER.info("Sending to " + path);
			
			ClientResponse resp = service.get(ClientResponse.class);
			String serviceResponse = resp.getEntity(String.class);
			result = Boolean.parseBoolean(serviceResponse);
			
		} catch (JSONException e) {
			LOGGER.error(e);
		} catch (UnsupportedEncodingException e) {
			LOGGER.info(e);
		}
		return result;
	}
}
