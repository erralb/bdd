import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
// import remarkMermaid from 'remark-mermaidjs'

export default defineConfig({
	site: 'https://erralb.github.io/bdd',
	base: '/bdd/',
	integrations: [
		starlight({
			title: 'Bases de données (BDD)',
			logo: {
			  src: './src/assets/logo.svg',
			},
			favicon: './src/assets/logo.svg',
			customCss: [
				'./src/style.css',
			],
			defaultLocale: 'root',
			// optional
			locales: {
				root: {
					label: 'Français',
					lang: 'fr-FR'
				},
				// en: {
				// 	label: 'English',
				// 	lang: 'en-US'
				// }
			},
			social: {
				github: 'https://github.com/erralb/bdd'
			},
			sidebar: [
				{
					label: '1 - Relationnelles & SQL',
					collapsed: true,
					items: [
						{
							label: '1.1 - Concepts',
							collapsed: true,
							autogenerate: {
								directory: '01-concepts',
							}
						},
						{
							label: '1.2 - Algèbre Relationnelle',
							collapsed: true,
							autogenerate: {
								directory: '02-algebre'
							}
						},
						{
							label: '1.3 - SQL DML 1',
							collapsed: true,
							autogenerate: {
								directory: '03-sql-dml1'
							}
						},
						{
							label: '1.4 -SQL DML 2',
							collapsed: true,
							autogenerate: {
								directory: '03-sql-dml2'
							}
						},
						{
							label: '1.5 - SQL DDL',
							collapsed: true,
							autogenerate: {
								directory: '04-sql-ddl'
							}
						},

					]
				},
				{
					label: '2 - Conception',
					collapsed: true,
					items: [
						{
							label: '2.1 - Introduction',
							collapsed: true,
							autogenerate: {
								directory: '05-conception'
							}
						},
						{
							label: '2.2 - Modèle Conceptuel de Données (MCD)',
							collapsed: true,
							autogenerate: {
								directory: '06-mcd'
							}
						},
						{
							label: '2.3 - Schéma Conceptuel',
							collapsed: true,
							autogenerate: {
								directory: '07-schema'
							}
						},
						{
							label: '2.4 - Modèle Logique de Données (MLD)',
							collapsed: true,
							autogenerate: {
								directory: '08-mld'
							}
						},

					]
				},
				{
					label: '3 - NoSQL',
					collapsed: true,
					autogenerate: {
						directory: '09-nosql'
					}
				}
			]
		}),
	],
	markdown: {
		// remarkPlugins: [remarkMermaid],
	},
});