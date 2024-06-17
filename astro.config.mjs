import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import mdx from '@astrojs/mdx';
import expressiveCode from "astro-expressive-code";
import remarkMermaid from 'remark-mermaidjs'

// https://astro.build/config
export default defineConfig({
	site: import.meta.env.SITE,
	integrations: [
		starlight({
			title: 'Bases de données',
			logo: {
			  src: './src/assets/logo.svg',
			},
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
				en: {
					label: 'English',
					lang: 'en-US'
				}
			},
			social: {
				github: 'https://github.com/erralb/'
			},
			sidebar: [
				{
					label: 'BDD relationnelles & SQL',
					items: [
						// Each item here is one entry in the navigation menu.
						{
							label: 'Concepts',
							autogenerate: {
								directory: '01-concepts'
							}
						},
						{
							label: 'Algèbre Relationnelle',
							autogenerate: {
								directory: '02-algebre'
							}
						},
						{
							label: 'SQL DML',
							autogenerate: {
								directory: '03-sql-dml'
							}
						},
						{
							label: 'SQL DDL',
							autogenerate: {
								directory: '04-sql-ddl'
							}
						},

					]
				},
				{
					label: 'Conception de BDD',
					items: [
						// Each item here is one entry in the navigation menu.
						{
							label: 'Introduction',
							autogenerate: {
								directory: '05-introduction'
							}
						},
						{
							label: 'MCD - Modèle Conceptuel de Données',
							autogenerate: {
								directory: '06-mcd'
							}
						},
						{
							label: 'Schéma Conceptuel',
							autogenerate: {
								directory: '07-schema'
							}
						},
						{
							label: 'MLD - Modèle Logique de Données',
							autogenerate: {
								directory: '08-mld'
							}
						},

					]
				},
				{
					label: 'BDD NoSQL',
					autogenerate: {
						directory: '09-nosql'
					}
				}
			]
		}),
		expressiveCode(),
		mdx(),
	],
	markdown: {
		// Applied to .md and .mdx files
		remarkPlugins: [remarkMermaid],
	},
});