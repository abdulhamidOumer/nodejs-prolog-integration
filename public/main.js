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
        fetch('/',{method:'POST',
        headers:{'Accept':'application/json','Content-Type':'application/json'},
        body:JSON.stringify({main: message,conID:conID})}).then(data =>{
            data.json().then(res => {
                var aiText = document.createElement("div");
                aiText.id = "aiMessage";
                aiText.innerHTML = "<p>"+res.message+"</p>";
                messageBox.appendChild(aiText);
                messageBox.scrollTo(0,messageBox.scrollHeight);
                conID = res.conID;
        });
        })

        

    }
};