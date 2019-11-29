/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strsub.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vtran <vtran@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/10/16 14:30:07 by vtran             #+#    #+#             */
/*   Updated: 2019/11/28 13:27:58 by vtran            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strsub(char *s, unsigned int start, size_t len)
{
	char	*r;

	if (!s || !(r = ft_memalloc(len + 1)))
		return (NULL);
	r = ft_strncpy(r, (char *)&(s[start]), len);
	free(s);
	return (r);
}
