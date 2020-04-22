({
	searchValue : function(component, JSONObject, CategoryName) {
        console.log('searching for ' + CategoryName);
        var bFound = false;
        for (var i=0; i < JSONObject.length; i++)
        {
            if (JSONObject[i].name == CategoryName){
                console.log('Group: ' + JSONObject[i].group);
                component.set('v.GroupName', JSONObject[i].group);
                bFound = true;
            }
        }
        
        if (bFound == false)
        {
            for (var i=0; i < JSONObject.length; i++)
        	{
            	if (JSONObject[i].items != null){
                	this.searchValue(component, JSONObject[i].items, CategoryName);
            	}
        	}
        }
	}
})
