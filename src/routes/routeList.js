import { lazy } from 'react';
import paths from './paths';

// const Login = lazy(() => import('../screens/login/Login'));
const NotFound = lazy(() => import('../screens/notFound/NotFound'));
const Home = lazy(() => import('../screens/home/Home'));
// const ListCosts = lazy(() => import('../screens/listCosts/ListCosts'));

export default (id) => {
	return [
		...publicRoutes,
		...(id ? privateRoutes : []),
		{
			path: '*',
			component: NotFound,
		},
	];
};

const publicRoutes = [
	// {
	// 	path: paths.login,
	// 	exact: true,
	// 	component: Login,
	// },
	{
		path: paths.home,
		exact: true,
		component: Home,
	},
];

const privateRoutes = [];