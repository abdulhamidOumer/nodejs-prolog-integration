var message = document.getElementById('message').value;
var messageBox = document.getElementById('messageContainer');
var inputBox = document.getElementById('message');
var conID = "None";

inputBox.onkeypress = function(e){
    if(e.keyCode===13){
        var message = document.getElementById('message').value;
        document.getElementById('message').value = "";
        console.log("Enter Pressed");
        var myText= document.createElement("div");
        myText.id = "myMessage";
        myText.innerHTML = "<p>"+message+"</p>";
        messageBox.appendChild(myText); 
        
        $.post("http://localhost:8080",{main: message,conID:conID})
         .done(function(data){
            var aiText = document.createElement("div");
            aiText.id = "aiMessage";
            aiText.innerHTML = "<p>"+data.message+"</p>";
            messageBox.appendChild(aiText);
            messageBox.scrollTo(0,messageBox.scrollHeight);
            conID = data.conID;
         });

        

    }
};