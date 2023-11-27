<%@page import="com.rm.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="chat-container">
    <div id="messageArea"></div>
    <input type="text" id="message" />
    <input type="button" id="sendBtn" value="전송"/>
</div>

<script type="text/javascript">
    $("#sendBtn").click(function() {
        sendMessage();
        $('#message').val('');
    });

    let sock = new SockJS("http://localhost/chatting");
    sock.onmessage = onMessage;
    sock.onclose = onClose;

    var memberName = "<%= ((MemberVO)session.getAttribute("member")).getName() %>";

 
    function sendMessage() {
        var message = memberName + ": " + $("#message").val();
        sock.send(message);
    }

  
    function onMessage(msg) {
        var data = msg.data;
        displayMessage(data);
    }

   r
    function onClose(evt) {
        displayMessage("Connection lost");
    }

 
    function displayMessage(message) {
        var messageDiv = $("<div>").addClass("message");

        if (message.startsWith(memberName)) {
            messageDiv.addClass("own-message").text(message);
        } else {
            messageDiv.addClass("other-message").text(message);
        }

        $("#messageArea").append(messageDiv);
    }
</script>