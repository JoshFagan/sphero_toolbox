function publish_message(message, topic)
    % Publish supplied message on specified topic

    msg = rosmessage(topic);
    msg.Data = message;
    send(topic,msg);
end % Publish message function