import { LightningElement } from 'lwc';
import templateOne from './firstcomponent.html';
import templateTwo from './secondcomponent.html';
export default class componentone extends LightningElement {
    showTemplateOne = true;
areDetailsvisible= false;
    render() {
        return this.showTemplateOne ? templateOne : templateTwo;
    }

    switchTemplate(){ 
        this.showTemplateOne = !this.showTemplateOne; 
    }
    handlechange(event){
this.areDetailsvisible=event.target.checked;
    }
}