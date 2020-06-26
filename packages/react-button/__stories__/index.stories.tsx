import React from 'react';
import Button from '../src';
//import {action} from '@storybook/addon-actions';
import {withKnobs} from '@storybook/addon-knobs';

export default {
    title: 'Button',
    component: Button,
    decorators: [withKnobs],
}

export const basic = () => <Button />;