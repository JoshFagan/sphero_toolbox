function [message_received] = relayMessage(this, message_sent)
    % Relay text message to Sphero

    this.publish_message(message_sent, this.relay_pub); % Publish message

    message_received = receive(this.relay_sub).Data; % Wait for responce from Sphero
end