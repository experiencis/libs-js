module.exports = {
    plugins: [
        '@monorepo-js-libs',
    ],
    groups: {
        root: {dir: '.'},
    },
    vars: {
        author: {
            name: 'Rodolphe Eveilleau',
            email: 'rodolphe@experiencis.fr',
        },
    },
    root: {
        '.': {
            type: 'monorepo-js-libs',
            vars: {
                project_prefix: 'experiencis',
                project_name: 'libs-js',
                project_git_url: 'git@github.com:experiencis/libs-js.git',
                node_version: '14.4.0',
                project_copyright: 'Copyright (c) 2020 Experiencis',
                npm_scope: 'experiencis',
            },
        },
    },
};
