function Upvote(id) {
    var obj = this;
    this.voteblock = document.getElementById(id);


    this.voteblock.addEventListener("onclick",  function(event) { 
        obj.mouseDown(event)
    });
    this.photo.onmousedown = function(event){
        event.preventDefault()
    };


}

Tagger.prototype.mouseDown = function(event){
    var obj = this;
    this.tag.style.display = "inline-block";

    this.isMouseDown = true;

    this.tag.style.height = 0 + "px";
    this.tag.style.width = 0 + "px";


    this.startX = event.pageX;
    this.startY = event.pageY;

    this.tag.style.left = event.pageX + "px";
    this.tag.style.top = event.pageY + "px";

    document.body.onmousemove = function(event) {
        obj.mouseMove(event);
    }

    document.body.onmouseup = function(event) {
        obj.mouseUp(event);
    }




}