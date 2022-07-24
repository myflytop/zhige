var zgPostHand = {
	lookMaxTime:10,
    lookRecord: function () {
        this.ajaxPost();
    },
    likeRecord: function () {

    },
    nastyRecord: function () {

    },
    shareRecord: function () {

    },
    scoreRecord: function () {

    },
    collectRecord: function () {
        
    }
}

var zgLocalStorage={
	storage:function (){
		return windons.localStorage;
	},
	addItem:function (key,value){
		this.storage.setItem(key,value);
	},
	removeItem:function (key){
		this.storage.removeItem(key);
	},
	getItem:function (key){
    return	this.storage.getItem(key);
	}
}