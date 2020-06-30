import React from 'react';
import Component from '../src';
//import {action} from '@storybook/addon-actions';
import {withKnobs} from '@storybook/addon-knobs';

export default {
    title: 'Component',
    component: Component,
    decorators: [withKnobs],
}

export const basic = () => <Component />;