import React from 'react';
import Aux from '../../../hoc/Aux/Aux';
import classes from './Input.css';

const input = (props) => {
  let inputElement = null;
  const inputClasses = [classes.InputElement]

  if(props.invalid && props.touched){
    inputClasses.push(classes.Invalid)
  }

  switch(props.elementType){
    case('input'):
      inputElement = <input
        className={inputClasses.join(' ')} 
        {...props.elementConfig}
        value={props.value}
        onChange={props.changed} />
      break;
    case('textarea'):
      inputElement = <textarea
        className={inputClasses.join(' ')}  
        {...props.elementConfig}
        value={props.value}
        onChange={props.changed} />
      break;
    case('select'):
      inputElement = (
        <select
          className={inputClasses.join(' ')}  
          value={props.value}
          onChange={props.changed}>
          {props.elementConfig.options.map(option => (
            <option key={option.value} value={option.value}>
              {option.displayValue}
            </option>
          ))}
        </select>
      );
      break;
    default:
      inputElement = <input 
        className={inputClasses.join(' ')} 
        {...props.elementConfig}
        value={props.value}
        onChange={props.changed} />;
  }

  return (
    <Aux>
      <div className={classes.Input}>
        {inputElement}    
      </div>
    </Aux>
  )
}

export default input;