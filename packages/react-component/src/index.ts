import {ComponentType} from 'react';
import withStyles, {Styles} from '@material-ui/core/styles/withStyles';

export const component = <P = any>(styles: Styles<any, any>, Component: ComponentType<any>) =>
    withStyles(styles)(Component) as ComponentType<P>
;

export default component