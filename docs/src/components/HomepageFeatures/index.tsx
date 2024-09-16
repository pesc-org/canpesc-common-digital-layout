import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  Svg: React.ComponentType<React.ComponentProps<'svg'>>;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Easy to Use',
    Svg: require('@site/static/img/undraw_certification_re_ifll.svg').default,
    description: (
      <>
        PESC CDL API is a developer friendly API designed to get you up
        and running in seconds.
      </>
    ),
  },
  {
    title: 'Focus on What Matters',
    Svg: require('@site/static/img/undraw_website_setup_re_d4y9.svg').default,
    description: (
      <>
        Forget about styling and formatting transcripts, leave that to us. 
        Focus on your business logic around higher education.
      </>
    ),
  },
  {
    title: 'Consistent Transformations',
    Svg: require('@site/static/img/undraw_certificate_re_yadi.svg').default,
    description: (
      <>
        Transform from PESC XML to a consistent format, with options for HTML and PDF output.
      </>
    ),
  },
];

function Feature({title, Svg, description}: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <Svg className={styles.featureSvg} role="img" />
      </div>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): JSX.Element {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
