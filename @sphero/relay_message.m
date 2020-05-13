function relay_message(this, message)
    % Relay text message to Sphero

    this.publish_message(message, this.relay_pub); % Publish message

    relayed_message = receive(this.relay_sub); % Wait for responce from Sphero
    disp('Message relayed from Sphero:');
    disp(relayed_message.Data); 
end