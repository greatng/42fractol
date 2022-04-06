/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   mandelbrot.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pngamcha <pngamcha@student.42bangkok.co    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/04 10:43:01 by pngamcha          #+#    #+#             */
/*   Updated: 2022/04/07 00:05:41 by pngamcha         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/fractol.h"

int	mandelbrot(t_fract mlx, double x, double y)
{
	double	x0;
	double	y0;
	double	x2;
	double	y2;
	int		i;

	x0 = x_scale(mlx, x);
	y0 = y_scale(mlx, y);
	i = 0;
	x = 0;
	y = 0;
	x2 = 0;
	y2 = 0;
	while (x2 + y2 <= 4 && ++i < 256)
	{
		y = 2 * x * y + y0;
		x = x2 - y2 + x0;
		x2 = pow(x, 2);
		y2 = pow(y, 2);
		i++;
	}
	return (i - 1);
}
