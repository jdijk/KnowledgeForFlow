({
    init: function (cmp) {
        console.log('init');
        var action = cmp.get("c.GetCategories");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS")
            {
                console.log(response.getReturnValue());
               cmp.set('v.items', JSON.parse(response.getReturnValue())); 
               cmp.set('v.itemsJSON', response.getReturnValue());
            }
        }
          
                          )
         $A.enqueueAction(action);
       
        
       
    },
    handleSelect: function (cmp, event, helper) {
        event.preventDefault();
       cmp.set('v.CategoryName', event.getParam('name'));
        console.log(event.getParam('name'));
        console.log(cmp.get("v.itemsJSON"));
        console.log(JSON.parse(cmp.get("v.itemsJSON")));
        helper.searchValue(cmp, JSON.parse(cmp.get("v.itemsJSON")),event.getParam('name'));
        console.log('Group: ' + cmp.get('v.GroupName'));
        console.log('done');
       
    },
    scriptloaded: function(cmp, event, helper)
    {       
        
    },

}) // eslint-disable-line
