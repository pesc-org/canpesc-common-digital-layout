import { themes as prismThemes } from 'prism-react-renderer';
import type { Config } from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

const config: Config = {
    title: 'PESC CDL API',
    tagline: 'A Docker-powered stateless API for displaying PESC XML transcripts',
    favicon: 'img/favicon.ico',

    // Set the production url of your site here
    url: 'https://pesc-org.github.io/',
    // Set the /<baseUrl>/ pathname under which your site is served
    // For GitHub pages deployment, it is often '/<projectName>/'
    baseUrl: '/canpesc-common-digital-layout/',

    // GitHub pages deployment config.
    // If you aren't using GitHub pages, you don't need these.
    organizationName: 'pesc-org', // Usually your GitHub org/user name.
    projectName: 'canpesc-common-digital-layout', // Usually your repo name.
    trailingSlash: false,
    onBrokenLinks: 'throw',
    onBrokenMarkdownLinks: 'warn',

    // Even if you don't use internationalization, you can use this field to set
    // useful metadata like html lang. For example, if your site is Chinese, you
    // may want to replace "en" with "zh-Hans".
    i18n: {
        defaultLocale: 'en',
        locales: ['en'],
    },

    presets: [
        [
            'classic',
            {
                docs: {
                    sidebarPath: './sidebars.ts',
                    // Please change this to your repo.
                    // Remove this to remove the "edit this page" links.
                    editUrl:
                        'https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/',
                },
                blog: {
                    showReadingTime: true,
                    // Please change this to your repo.
                    // Remove this to remove the "edit this page" links.
                    editUrl:
                        'https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/',
                },
                theme: {
                    customCss: './src/css/custom.css',
                },
            } satisfies Preset.Options,
        ],
    ],

    themeConfig: {
        // Replace with your project's social card
        image: 'img/docusaurus-social-card.jpg',
        navbar: {
            title: 'PESC CDL API',
            logo: {
                alt: 'PESC CDL API',
                src: 'img/pesc.png',
            },
            items: [
                {
                    type: 'docSidebar',
                    sidebarId: 'docsSidebar',
                    position: 'left',
                    label: 'Docs',
                },
                {
                    href: 'https://github.com/pesc-org/canpesc-common-digital-layout',
                    label: 'GitHub',
                    position: 'right',
                },
            ],
        },
        footer: {
            style: 'dark',
            links: [
                {
                    title: 'Docs',
                    items: [
                        {
                            label: 'Docs',
                            to: '/docs/intro',
                        },
                        {
                            label: 'License',
                            to: 'https://github.com/pesc-org/canpesc-common-digital-layout/blob/main/LICENSE',
                        },
                        
                    ],
                },
                {
                    title: 'Source',
                    items: [
                        {
                            label: 'GitHub Repository',
                            href: 'https://github.com/pesc-org/canpesc-common-digital-layout',
                        },
                        {
                            label: 'Sample Transcripts',
                            href: 'https://github.com/pesc-org/canpesc-common-digital-layout/tree/main/samples',
                        },
                    ],
                },
                {
                    title: 'PESC',
                    items: [
                        {
                            label: 'Pesc.org',
                            href: 'https://pesc.org',
                        },
                        {
                            label: 'CanPESC User Group',
                            href: 'https://pesc.org/canadian-pesc-user-group/',
                        },
                        {
                            label: 'PESC College Transcript Standard',
                            href: 'https://pesc.org/college-transcript/',
                        },
                        {
                            label: 'PESC High School Transcript Standard',
                            href: 'https://pesc.org/high-school-transcript/',
                        },
                        
                    ],
                },
                
            ],
            copyright: `Copyright © ${new Date().getFullYear()} CanPESC. Built with Docusaurus.`,
        },
        prism: {
            theme: prismThemes.github,
            darkTheme: prismThemes.dracula,
        },
    } satisfies Preset.ThemeConfig,
};

export default config;
