const phoneRegex = /0[1-9]((\d{2}){4})/

export const required = value => value ? false : 'Champs Obligatoire'
export const customRequired= text => value => value ? false : `${text}`
export const number = value => value && isNaN(Number(value)) ? 'Veuillez enter un chiffre' : false
export const minValue = min => value => value && value < min ? `Valeur minimum ${min}` : false
export const maxValue = max => value => value && value > max ? `Valeur maximum ${max}` : false
export const betweenValues = (min, max) => value => value && (value > max || value < min) ? `Valeur entre ${min} et ${max}` : false
export const minLength = min => value => value && value.length < min ? `Minimum ${min} characters` : false
export const maxLength = max => value => value && value.length > max ? `Maximum ${max} characters` : false
export const isPhone =  value => value && value.length === 10 && phoneRegex.test(value)  ? false : `Ce n'est pas un numéro de téléphone valide`

