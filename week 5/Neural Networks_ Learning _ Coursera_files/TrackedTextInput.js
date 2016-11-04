define("bundles/page/components/TrackedTextInput",["require","exports","module","react","js/app/retracked"],function(require,exports,module){"use strict";function _defaults(e,a){for(var o=Object.getOwnPropertyNames(a),t=0;t<o.length;t++){var r=o[t],n=Object.getOwnPropertyDescriptor(a,r);n&&n.configurable&&void 0===e[r]&&Object.defineProperty(e,r,n)}return e}function _objectWithoutProperties(t,n){var r={};for(var e in t){if(n.indexOf(e)>=0)continue;if(!Object.prototype.hasOwnProperty.call(t,e))continue;r[e]=t[e]}return r}function _classCallCheck(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}function _possibleConstructorReturn(t,e){if(!t)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return!e||"object"!=typeof e&&"function"!=typeof e?t:e}function _inherits(t,e){if("function"!=typeof e&&null!==e)throw new TypeError("Super expression must either be null or a function, not "+typeof e);t.prototype=Object.create(e&&e.prototype,{constructor:{value:t,enumerable:!1,writable:!0,configurable:!0}}),e&&(Object.setPrototypeOf?Object.setPrototypeOf(t,e):_defaults(t,e))}var r=Object.assign||function(n){for(var e=1;e<arguments.length;e++){var t=arguments[e];for(var r in t)Object.prototype.hasOwnProperty.call(t,r)&&(n[r]=t[r])}return n},t,n,e=require("react"),a=require("js/app/retracked"),o=(n=t=function(t){function TrackedTextInput(){var o,e,s;_classCallCheck(this,TrackedTextInput);for(var c=arguments.length,p=Array(c),n=0;c>n;n++)p[n]=arguments[n];return o=e=_possibleConstructorReturn(this,t.call.apply(t,[this].concat(p))),e.trackClick=function(t){a.trackComponent(e.context._eventData,e.props.data,e.props.trackingName,"click"),e.props.onClick&&e.props.onClick(t)},e.trackKeyPress=function(t){"Enter"===t.key&&a.trackComponent(e.context._eventData,r({},e.props.data,{inputValue:e.refs.input.value,pressedKey:t.key}),e.props.trackingName,"key_press"),e.props.onKeyPress&&e.props.onKeyPress(t)},s=o,_possibleConstructorReturn(e,s)}return _inherits(TrackedTextInput,t),TrackedTextInput.prototype.render=function render(){var a=this.context._eventData&&this.context._eventData.namespace||{},s=a.app,c=a.page,n=void 0,p=this.props.trackingName,t=this.props,k=t.trackingName,i=t.className,u=t.data,l=t.onClick,f=t.onKeyPress,y=t.children,o=_objectWithoutProperties(t,["trackingName","className","data","onClick","onKeyPress","children"]);return n=this.onKeyPress?"key_press":"click",e.createElement("input",r({ref:"input",onClick:this.trackClick,onKeyPress:this.trackKeyPress,"data-track":!0,"data-track-app":s,"data-track-page":c,"data-track-action":n,"data-track-component":p,className:this.props.className},o),this.props.children)},TrackedTextInput}(e.Component),t.propTypes={trackingName:e.PropTypes.string.isRequired,className:e.PropTypes.string,data:e.PropTypes.object,onClick:e.PropTypes.func,onKeyPress:e.PropTypes.func,children:e.PropTypes.node},t.contextTypes={_eventData:e.PropTypes.object},n);module.exports=o});