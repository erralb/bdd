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
					label: 'Informations',
					slug: '00-infos/01-intro',
				},
				{
					label: '1 - Relationnelles & SQL',
					// collapsed: true,
					items: [
						{
							label: '1. Concepts',
							collapsed: true,
							autogenerate: {
								directory: '01-concepts',
							}
						},

						{
							label: '2. Algèbre Relationnelle',
							collapsed: true,
							// autogenerate: {
							// 	directory: '02-algebre'
							// }
							items: [
								{
									slug: '02-algebre/01-introduction',
								},
								{
									label: 'Opérateurs',
									// autogenerate: {
									// 	directory: '02-algebre/02-operateurs'
									// },
									items: [
										{ slug: '02-algebre/02-operateurs/01-projection' },
										{ slug: '02-algebre/02-operateurs/02-selection' },
										{ slug: '02-algebre/02-operateurs/03-produit' },
										{ slug: '02-algebre/02-operateurs/04-jointure' },
										{ slug: '02-algebre/02-operateurs/05-division' },
										{ slug: '02-algebre/02-operateurs/06-union' },
										{ slug: '02-algebre/02-operateurs/07-intersection' },
										{ slug: '02-algebre/02-operateurs/08-difference' },
										{ slug: '02-algebre/02-operateurs/09-complement' },
									]

								},
								{
									slug: '02-algebre/03-optimisation',
								},
								{
									slug: '02-algebre/04-conclusion',
								},
								{
									slug: '02-algebre/05-exercices',
								},
								{
									slug: '02-algebre/06-td2-algebre',
								},
								{
									slug: '02-algebre/06-td2-algebre-corrige',
								},
								{
									slug: '02-algebre/07-fiche-resume',
								},

							]
						},
						{
							label: '3. Les bases du SQL',
							collapsed: true,
							autogenerate: {
								directory: '03-sql-dml1'
							},
						},
						// {
						// 	label: '4. Travaux Pratiques 1',
						// 	collapsed: true,
						// 	autogenerate: {
						// 		directory: '04-tp1'
						// 	}
						// },
						// {
						// 	label: '5. SQL Avancé',
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
						{ slug: 'sql-compiler' },

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
