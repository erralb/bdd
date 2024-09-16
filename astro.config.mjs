import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import remarkMermaid from 'remark-mermaidjs'

export default defineConfig({
	site: 'https://erralb.github.io/bdd',
	base: '/bdd/',

	// site: 'https://erralb.com/bdd',
	// base: '/bdd/',

	// site: import.meta.env.SITE,
	// base: import.meta.env.BASE,
	integrations: [
		starlight({
			title: 'Bases de données',
			logo: {
				src: './src/assets/logo.svg',
			},
			favicon: './src/assets/logo.svg',
			customCss: [
				'./src/style.css',
			],
			components: {
				//override PageTitle to add presentation link
				PageTitle: './src/components/PageTitle.astro',
			},
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
					// collapsed: true,
					items: [
						{
							label: '1. Concepts',
							// collapsed: true,
							autogenerate: {
								directory: '01-concepts',
							}
						},

						// {
						// 	label: '2. Algèbre Relationnelle',
						// 	collapsed: true,
						// 	// autogenerate: {
						// 	// 	directory: '02-algebre'
						// 	// }
						// 	items: [
						// 		{
						// 			label: '1. Introduction',
						// 			slug: '02-algebre/01-introduction',
						// 		},
						// 		{
						// 			label: '2. Opérateurs',
						// 			autogenerate: {
						// 				directory: '02-algebre/02-operateurs'
						// 			}
						// 		},
						// 		{
						// 			label: '3. Conclusion',
						// 			slug: '02-algebre/03-conclusion',
						// 		},
						// 		{
						// 			label: '4. Exercices',
						// 			slug: '02-algebre/04-exercices',
						// 		},
						// 		{
						// 			label: '5. TD2',
						// 			slug: '02-algebre/05-td2-algebre',
						// 		},

						// 	]
						// },

						// {
						// 	label: '3. Les bases du SQL',
						// 	collapsed: true,
						// 	autogenerate: {
						// 		directory: '03-sql-dml1'
						// 	}
						// },
						// {
						// 	label: '4. SQL Avancé',
						// 	collapsed: true,
						// 	autogenerate: {
						// 		directory: '03-sql-dml2'
						// 	}
						// },
						// {
						// 	label: '5. Création de BDD',
						// 	collapsed: true,
						// 	autogenerate: {
						// 		directory: '04-sql-ddl'
						// 	}
						// },
						// {
						// 	label: '6. Triggers & Procédures',
						// 	collapsed: true,
						// 	autogenerate: {
						// 		directory: '04-sql-ddl'
						// 	}
						// },

					]
				},
				// {
				// 	label: '2 - Conception',
				// 	collapsed: true,
				// 	items: [
				// 		{
				// 			label: '1. Introduction',
				// 			collapsed: true,
				// 			autogenerate: {
				// 				directory: '05-conception'
				// 			}
				// 		},
				// 		{
				// 			label: '2. Modèle Conceptuel de Données (MCD)',
				// 			collapsed: true,
				// 			autogenerate: {
				// 				directory: '06-mcd'
				// 			}
				// 		},
				// 		{
				// 			label: '3. Schéma Conceptuel',
				// 			collapsed: true,
				// 			autogenerate: {
				// 				directory: '07-schema'
				// 			}
				// 		},
				// 		{
				// 			label: '4. Modèle Logique de Données (MLD)',
				// 			collapsed: true,
				// 			autogenerate: {
				// 				directory: '08-mld'
				// 			}
				// 		},

				// 	]
				// },
				// {
				// 	label: '3 - NoSQL',
				// 	collapsed: true,
				// 	autogenerate: {
				// 		directory: '09-nosql'
				// 	}
				// }
			]
		}),
	],
	markdown: {
		remarkPlugins: [remarkMermaid],
	},
});
