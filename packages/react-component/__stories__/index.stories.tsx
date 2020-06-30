import React from 'react';
import {withKnobs, text} from '@storybook/addon-knobs';
import {action} from "@storybook/addon-actions";
import component from "../src";

const DummyComponent = component({
    root: {
        backgroundColor: props => props.color,
        color: 'white',
    },
}, ({classes = {}, children, ...props}) => (
    <div className={classes.root} {...props}>{children}</div>
));

export default {
    title: 'Component',
    component: DummyComponent,
    decorators: [withKnobs],
}

export const basic = () => (
    <DummyComponent color={text('Color', 'pink')} onClick={action('click')}>
        {text('Content', 'THIS IS THE CONTENT')}
    </DummyComponent>
);